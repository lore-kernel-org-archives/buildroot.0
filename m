From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Nov 2015 11:00:41 +0100
Subject: [Buildroot] [PATCH v3] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <5641BDB9.1000601@imgtec.com>
References: <20150920144637.25230558@free-electrons.com>
 <1442827716-8802-1-git-send-email-markos.chandras@imgtec.com>
 <560E3F24.90109@imgtec.com> <5641BDB9.1000601@imgtec.com>
Message-ID: <20151110110041.56a13980@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markos,

On Tue, 10 Nov 2015 09:49:45 +0000, Markos Chandras wrote:

> ping?

I think the reason I still don't apply this patch is because I'm not
happy with Buildroot doing all this complicated logic to install the
tests, and that it should be part of the libseccomp build system to
provide a mechanism to do that easily.

So if you want to see this integrated, I would recommend to work with
upstream libseccomp to implement something allowing the installation of
tests, and then use it in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
