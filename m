From: Scott Bartolett <SBartolett@thorlabs.com>
Date: Thu, 15 Jul 2021 20:39:00 +0000
Subject: [Buildroot] Using Intel TBB in Buildroot environment
Message-ID: <SJ0PR08MB6542FA0233EE2F8E14C32938B8129@SJ0PR08MB6542.namprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

Is it possible to use Intel Threading Building Blocks in a Buildroot environment?  I am having trouble compiling our application when I include the tbb library.  I have the application working fine running on Raspbian on a RPi.  But when I try to cross compile it for Buildroot I am getting undefined references to tbb::detail::*.  I am trying to use the same libraries that I used in Raspbian.  Do I need to recompile the libraries for buildroot?  If so, does anyone have any experience doing this?

Thanks,
Scott

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210715/9826b258/attachment-0001.html>
