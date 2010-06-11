From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Fri, 11 Jun 2010 14:56:35 +0200
Subject: [Buildroot] Linux from file in buildroot with external toolchain
Message-ID: <BLU0-SMTP746AC14EB6D66389DECA50E7D90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot 2010.05 with an external toolchain (actually 
crosstool-ng) and I am finding it very difficult to find the setting to take 
the linux source code from a local file.  If I use the buildroot toolchain 
instead, then under the Toolchain menu and Kernel Headers sub-menu I can 
select a local linux snapshot and then, under the Kernal menu select to use 
the same linux version as used for the headers.  This works.

However, when using the external toolchain, it doesn't seem possible to do 
this -- I expect that I have missed something really obvious, but a good 
while Googling, trying things and failing, and I can't find it.

Can anyone point me right?

Many thanks
Andy
