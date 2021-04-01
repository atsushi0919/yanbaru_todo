RSpec.describe Task do
  let(:task_params) { { title: "洗濯", content: "7時までに干し終える" } }
  let(:task) { Task.new(**task_params) }
  let!(:base_id) { Task.class_variable_get("@@count") }
  describe ".initialize" do
    context "インスタンスが生成されたとき" do
      it "クラス変数 @@count が 1 増加すること" do
        expect { Task.new(**task_params) }.to change { Task.class_variable_get("@@count") }.by(1)
      end

      it "タスクの @id がインスタンス生成前の @@countに+1 した値と等しいこと" do
        expect(task.id).to eq base_id + 1
      end

      it "タスクの @title が task_params の title と等しいこと" do
        expect(task.title).to eq "洗濯"
      end

      it "タスクの @content が task_params の content と等しいこと" do
        expect(task.content).to eq "7時までに干し終える"
      end
    end
  end

  describe ".info" do
    let(:info_msg) { "[No.#{base_id + 1}] 洗濯: 7時までに干し終える\n" }
    it "id, title, content が正しいフォーマットで表示されること" do
      expect { task.info }.to output(info_msg).to_stdout
    end
  end
end
