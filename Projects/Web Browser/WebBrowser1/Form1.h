#pragma once

namespace WebBrowser1 {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for Form1
	/// </summary>
	public ref class Form1 : public System::Windows::Forms::Form
	{
	public:
		Form1(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~Form1()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::MenuStrip^  menuStrip1;
	protected: 
	private: System::Windows::Forms::MenuStrip^  menuStrip2;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem1;	//File
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem3;	
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem4;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem5;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem6;
	private: System::Windows::Forms::ToolStripMenuItem^  printToolStripMenuItem;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem2;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem8;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem9;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem10;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem11;
	private: System::Windows::Forms::ToolStripMenuItem^  toolStripMenuItem7;
	private: System::Windows::Forms::ToolStrip^  toolStrip3;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton1;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton2;
	private: System::Windows::Forms::ToolStripTextBox^  toolStripTextBox1;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton3;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton4;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton11;
	private: System::Windows::Forms::ToolStripButton^  toolStripButton12;
	private: System::Windows::Forms::WebBrowser^  webBrowser2;




	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			System::ComponentModel::ComponentResourceManager^  resources = (gcnew System::ComponentModel::ComponentResourceManager(Form1::typeid));
			this->menuStrip2 = (gcnew System::Windows::Forms::MenuStrip());
			this->toolStripMenuItem1 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem3 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem4 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem5 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem6 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->printToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem2 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem8 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem9 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem10 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem11 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStripMenuItem7 = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->toolStrip3 = (gcnew System::Windows::Forms::ToolStrip());
			this->toolStripButton1 = (gcnew System::Windows::Forms::ToolStripButton());
			this->toolStripButton2 = (gcnew System::Windows::Forms::ToolStripButton());
			this->toolStripTextBox1 = (gcnew System::Windows::Forms::ToolStripTextBox());
			this->toolStripButton3 = (gcnew System::Windows::Forms::ToolStripButton());
			this->toolStripButton4 = (gcnew System::Windows::Forms::ToolStripButton());
			this->toolStripButton11 = (gcnew System::Windows::Forms::ToolStripButton());
			this->toolStripButton12 = (gcnew System::Windows::Forms::ToolStripButton());
			this->webBrowser2 = (gcnew System::Windows::Forms::WebBrowser());
			this->menuStrip2->SuspendLayout();
			this->toolStrip3->SuspendLayout();
			this->SuspendLayout();
			// 
			// menuStrip2
			// 
			this->menuStrip2->Items->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(3) {this->toolStripMenuItem1, 
				this->toolStripMenuItem2, this->toolStripMenuItem7});
			this->menuStrip2->Location = System::Drawing::Point(0, 0);
			this->menuStrip2->Name = L"menuStrip2";
			this->menuStrip2->Size = System::Drawing::Size(784, 24);
			this->menuStrip2->TabIndex = 0;
			this->menuStrip2->Text = L"menuStrip2";
			// 
			// toolStripMenuItem1
			// 
			this->toolStripMenuItem1->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(5) {this->toolStripMenuItem3, 
				this->toolStripMenuItem4, this->toolStripMenuItem5, this->toolStripMenuItem6, this->printToolStripMenuItem});
			this->toolStripMenuItem1->Name = L"toolStripMenuItem1";
			this->toolStripMenuItem1->Size = System::Drawing::Size(37, 20);
			this->toolStripMenuItem1->Text = L"File";
			// 
			// toolStripMenuItem3
			// 
			this->toolStripMenuItem3->Name = L"toolStripMenuItem3";
			this->toolStripMenuItem3->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::N));
			this->toolStripMenuItem3->Size = System::Drawing::Size(166, 22);
			this->toolStripMenuItem3->Text = L"New";
			// 
			// toolStripMenuItem4
			// 
			this->toolStripMenuItem4->Name = L"toolStripMenuItem4";
			this->toolStripMenuItem4->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::O));
			this->toolStripMenuItem4->Size = System::Drawing::Size(166, 22);
			this->toolStripMenuItem4->Text = L"Open";
			this->toolStripMenuItem4->Click += gcnew System::EventHandler(this, &Form1::toolStripMenuItem4_Click);
			// 
			// toolStripMenuItem5
			// 
			this->toolStripMenuItem5->Name = L"toolStripMenuItem5";
			this->toolStripMenuItem5->ShortcutKeys = static_cast<System::Windows::Forms::Keys>(((System::Windows::Forms::Keys::Control | System::Windows::Forms::Keys::Alt) 
				| System::Windows::Forms::Keys::E));
			this->toolStripMenuItem5->Size = System::Drawing::Size(166, 22);
			this->toolStripMenuItem5->Text = L"Close";
			this->toolStripMenuItem5->Click += gcnew System::EventHandler(this, &Form1::toolStripMenuItem5_Click);
			// 
			// toolStripMenuItem6
			// 
			this->toolStripMenuItem6->Name = L"toolStripMenuItem6";
			this->toolStripMenuItem6->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::S));
			this->toolStripMenuItem6->Size = System::Drawing::Size(166, 22);
			this->toolStripMenuItem6->Text = L"Save As";
			this->toolStripMenuItem6->Click += gcnew System::EventHandler(this, &Form1::toolStripMenuItem6_Click);
			// 
			// printToolStripMenuItem
			// 
			this->printToolStripMenuItem->Name = L"printToolStripMenuItem";
			this->printToolStripMenuItem->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::P));
			this->printToolStripMenuItem->Size = System::Drawing::Size(166, 22);
			this->printToolStripMenuItem->Text = L"Print";
			this->printToolStripMenuItem->Click += gcnew System::EventHandler(this, &Form1::printToolStripMenuItem_Click);
			// 
			// toolStripMenuItem2
			// 
			this->toolStripMenuItem2->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(4) {this->toolStripMenuItem8, 
				this->toolStripMenuItem9, this->toolStripMenuItem10, this->toolStripMenuItem11});
			this->toolStripMenuItem2->Name = L"toolStripMenuItem2";
			this->toolStripMenuItem2->Size = System::Drawing::Size(39, 20);
			this->toolStripMenuItem2->Text = L"Edit";
			// 
			// toolStripMenuItem8
			// 
			this->toolStripMenuItem8->Name = L"toolStripMenuItem8";
			this->toolStripMenuItem8->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::C));
			this->toolStripMenuItem8->Size = System::Drawing::Size(143, 22);
			this->toolStripMenuItem8->Text = L"Copy";
			// 
			// toolStripMenuItem9
			// 
			this->toolStripMenuItem9->Name = L"toolStripMenuItem9";
			this->toolStripMenuItem9->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::X));
			this->toolStripMenuItem9->Size = System::Drawing::Size(143, 22);
			this->toolStripMenuItem9->Text = L"Cut";
			// 
			// toolStripMenuItem10
			// 
			this->toolStripMenuItem10->Name = L"toolStripMenuItem10";
			this->toolStripMenuItem10->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::V));
			this->toolStripMenuItem10->Size = System::Drawing::Size(143, 22);
			this->toolStripMenuItem10->Text = L"Paste";
			// 
			// toolStripMenuItem11
			// 
			this->toolStripMenuItem11->Name = L"toolStripMenuItem11";
			this->toolStripMenuItem11->ShortcutKeys = static_cast<System::Windows::Forms::Keys>((System::Windows::Forms::Keys::Alt | System::Windows::Forms::Keys::A));
			this->toolStripMenuItem11->Size = System::Drawing::Size(143, 22);
			this->toolStripMenuItem11->Text = L"Select";
			// 
			// toolStripMenuItem7
			// 
			this->toolStripMenuItem7->Name = L"toolStripMenuItem7";
			this->toolStripMenuItem7->ShortcutKeys = static_cast<System::Windows::Forms::Keys>(((System::Windows::Forms::Keys::Control | System::Windows::Forms::Keys::Shift) 
				| System::Windows::Forms::Keys::A));
			this->toolStripMenuItem7->Size = System::Drawing::Size(52, 20);
			this->toolStripMenuItem7->Text = L"About";
			this->toolStripMenuItem7->Click += gcnew System::EventHandler(this, &Form1::toolStripMenuItem7_Click);
			// 
			// toolStrip3
			// 
			this->toolStrip3->Items->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(7) {this->toolStripButton1, 
				this->toolStripButton2, this->toolStripTextBox1, this->toolStripButton3, this->toolStripButton4, this->toolStripButton11, this->toolStripButton12});
			this->toolStrip3->Location = System::Drawing::Point(0, 24);
			this->toolStrip3->Name = L"toolStrip3";
			this->toolStrip3->Size = System::Drawing::Size(784, 25);
			this->toolStrip3->TabIndex = 1;
			this->toolStrip3->Text = L"toolStrip3";
			// 
			// toolStripButton1
			// 
			this->toolStripButton1->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton1.Image")));
			this->toolStripButton1->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton1->Name = L"toolStripButton1";
			this->toolStripButton1->Size = System::Drawing::Size(52, 22);
			this->toolStripButton1->Text = L"Back";
			this->toolStripButton1->Click += gcnew System::EventHandler(this, &Form1::toolStripButton1_Click);
			// 
			// toolStripButton2
			// 
			this->toolStripButton2->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton2.Image")));
			this->toolStripButton2->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton2->Name = L"toolStripButton2";
			this->toolStripButton2->RightToLeftAutoMirrorImage = true;
			this->toolStripButton2->Size = System::Drawing::Size(70, 22);
			this->toolStripButton2->Text = L"Forward";
			this->toolStripButton2->Click += gcnew System::EventHandler(this, &Form1::toolStripButton2_Click);
			// 
			// toolStripTextBox1
			// 
			this->toolStripTextBox1->Name = L"toolStripTextBox1";
			this->toolStripTextBox1->Size = System::Drawing::Size(300, 25);
			this->toolStripTextBox1->KeyDown += gcnew System::Windows::Forms::KeyEventHandler(this, &Form1::toolStripTextBox1_KeyDown);
			// 
			// toolStripButton3
			// 
			this->toolStripButton3->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton3.Image")));
			this->toolStripButton3->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton3->Name = L"toolStripButton3";
			this->toolStripButton3->Size = System::Drawing::Size(45, 22);
			this->toolStripButton3->Text = L"Go!";
			this->toolStripButton3->Click += gcnew System::EventHandler(this, &Form1::toolStripButton3_Click);
			// 
			// toolStripButton4
			// 
			this->toolStripButton4->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton4.Image")));
			this->toolStripButton4->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton4->Name = L"toolStripButton4";
			this->toolStripButton4->Size = System::Drawing::Size(51, 22);
			this->toolStripButton4->Text = L"Stop";
			this->toolStripButton4->Click += gcnew System::EventHandler(this, &Form1::toolStripButton4_Click);
			// 
			// toolStripButton11
			// 
			this->toolStripButton11->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton11.Image")));
			this->toolStripButton11->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton11->Name = L"toolStripButton11";
			this->toolStripButton11->Size = System::Drawing::Size(66, 22);
			this->toolStripButton11->Text = L"Refresh";
			this->toolStripButton11->Click += gcnew System::EventHandler(this, &Form1::toolStripButton11_Click);
			// 
			// toolStripButton12
			// 
			this->toolStripButton12->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"toolStripButton12.Image")));
			this->toolStripButton12->ImageTransparentColor = System::Drawing::Color::Magenta;
			this->toolStripButton12->Name = L"toolStripButton12";
			this->toolStripButton12->Size = System::Drawing::Size(60, 22);
			this->toolStripButton12->Text = L"Home";
			this->toolStripButton12->Click += gcnew System::EventHandler(this, &Form1::toolStripButton12_Click);
			// 
			// webBrowser2
			// 
			this->webBrowser2->Dock = System::Windows::Forms::DockStyle::Fill;
			this->webBrowser2->Location = System::Drawing::Point(0, 49);
			this->webBrowser2->MinimumSize = System::Drawing::Size(20, 20);
			this->webBrowser2->Name = L"webBrowser2";
			this->webBrowser2->Size = System::Drawing::Size(784, 513);
			this->webBrowser2->TabIndex = 2;
			this->webBrowser2->DocumentTitleChanged += gcnew System::EventHandler(this, &Form1::webBrowser2_DocumentTitleChanged);
			this->webBrowser2->Navigated += gcnew System::Windows::Forms::WebBrowserNavigatedEventHandler(this, &Form1::webBrowser2_Navigated);
			// 
			// Form1
			// 
			this->ClientSize = System::Drawing::Size(784, 562);
			this->Controls->Add(this->webBrowser2);
			this->Controls->Add(this->toolStrip3);
			this->Controls->Add(this->menuStrip2);
			this->MainMenuStrip = this->menuStrip2;
			this->Name = L"Form1";
			this->menuStrip2->ResumeLayout(false);
			this->menuStrip2->PerformLayout();
			this->toolStrip3->ResumeLayout(false);
			this->toolStrip3->PerformLayout();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
		 //Open Click
private: System::Void toolStripMenuItem4_Click(System::Object^  sender, System::EventArgs^  e) {
			 OpenFileDialog^ fd = gcnew OpenFileDialog;
			  fd->DefaultExt = "*.";
			  fd->ShowDialog();
		 }
private: System::Void toolStripMenuItem5_Click(System::Object^  sender, System::EventArgs^  e) {
			 Form1::Close();
		 }
private: System::Void toolStripMenuItem6_Click(System::Object^  sender, System::EventArgs^  e) {
			 this->webBrowser2->ShowSaveAsDialog();
		 }
private: System::Void printToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
			  this->webBrowser2->ShowPrintDialog();
		 }
private: System::Void toolStripButton1_Click(System::Object^  sender, System::EventArgs^  e) {
			  webBrowser2->GoBack();
		 }
private: System::Void toolStripButton2_Click(System::Object^  sender, System::EventArgs^  e) {
			 webBrowser2->GoForward();
		 }
		 //Go
private: System::Void toolStripButton3_Click(System::Object^  sender, System::EventArgs^  e) {
			 if (  !this->toolStripTextBox1->Text->Equals( "" ) )
			 {
					this->webBrowser2->Navigate( this->toolStripTextBox1->Text );
			 }
		 }
		 //Stop
private: System::Void toolStripButton4_Click(System::Object^  sender, System::EventArgs^  e) {
			 webBrowser2->Stop();
		 }
		 //Refresh
private: System::Void toolStripButton11_Click(System::Object^  sender, System::EventArgs^  e) {
			 webBrowser2->Refresh();
		 }
		 //Home
private: System::Void toolStripButton12_Click(System::Object^  sender, System::EventArgs^  e) {
			 webBrowser2->GoHome();
		 }
		 //URL handler
private: System::Void toolStripTextBox1_KeyDown( Object^ sender, System::Windows::Forms::KeyEventArgs^ e) {
			  if ( e->KeyCode == System::Windows::Forms::Keys::Enter &&  !this->toolStripTextBox1->Text->Equals( "" ) )
			  {
					this->webBrowser2->Navigate( this->toolStripTextBox1->Text );
			  }

		 }
		 //Text Box Handler
		 void webBrowser2_Navigated( Object^ sender, System::Windows::Forms::WebBrowserNavigatedEventArgs^ /*e*/)
		 {
			this->toolStripTextBox1->Text = this->webBrowser2->Url->ToString();
		 }
		 //Document Title Handler
		 void webBrowser2_DocumentTitleChanged( Object^ sender, System::EventArgs^ /*e*/ )
		 {
			this->Text = webBrowser2->DocumentTitle;
		 }
private: System::Void toolStripMenuItem7_Click(System::Object^  sender, System::EventArgs^  e) {
			 MessageBox::Show("Windows Form Application Browser Created By AC Corp. Pvt. Ltd.","About Us",MessageBoxButtons::OK,MessageBoxIcon::Information);
		 }
};
}