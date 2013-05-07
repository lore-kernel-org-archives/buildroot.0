From: Mark Dunn <mark.dunn@telecomfm.co.uk>
Date: Tue, 7 May 2013 17:52:34 +0100
Subject: [Buildroot] Orphaned configuration. No base extension cfg exists for
	org.buildroot.home.mark.buildroot_bf.output.exe.debug.836522578
Message-ID: <D29DA78A35E2B84DAA82920492275FA8B5953CD7B3@TFM9.telecomfm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I create a project "test7" in Eclipse and select the buildroot toolchain and press the finish button.
I can see all the include directories, libraries etc. everything looks good
In particular I look in "properties" - "c/c++ Build" and see the c/c++ build settings.

I then close eclipse and reopen it.
When I go to "properties" - "c/c++ Build" I see

"Orphaned configuration. No base extension cfg exists for org.buildroot.home.mark.buildroot_bf.output.exe.debug.836522578"

When I try to create a new project, the buildroot toolchain is missing

If I then
Delete the test7 project
Close eclipse
Delete .metadata
Open Eclipse

I can then create a new project with buildroot toolchain

What is going wrong please?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130507/3a5e6395/attachment-0001.html>
