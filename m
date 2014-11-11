From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 14:03:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-09
In-Reply-To: <5461FCCA.1000306@imgtec.com>
References: <20141110073015.A5296101317@stock.ovh.net>
 <5460DF8D.6090705@imgtec.com> <5460E0B8.1060705@imgtec.com>
 <20141110191617.43273fde@free-electrons.com>
 <5461FCCA.1000306@imgtec.com>
Message-ID: <20141111140317.18f56b7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 11 Nov 2014 12:10:50 +0000, Vicente Olivert Riera wrote:

> Do you remember when we talked about finding which architectures support
> BR2_PACKAGE_QT_SCRIPT to create a new
> BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT in order to differentiate them from
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT? Because BR2_PACKAGE_QT_SCRIPT
> builds fine for MIPS64 n32, but it depends on
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT. So, if you disable
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT for MIPS64 n32 then you will be
> disabling BR2_PACKAGE_QT_SCRIPT as well. That's why few months ago I
> wanted to disable only BR2_PACKAGE_QT_WEBKIT for MIPS64 n32, but then
> you told me "Hey, there is something wrong here! We need to know which
> architectures support qt-script and which ones support qt-webkit".

Well, then why don't you create BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
