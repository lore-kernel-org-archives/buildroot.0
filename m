From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:50:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/jailhouse: python scripts needs
 python-mako
In-Reply-To: <20191109213352.13020-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 9 Nov 2019 22:33:52 +0100")
References: <20191109213352.13020-1-fontaine.fabrice@gmail.com>
Message-ID: <87imnhs60u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > jailhouse-config-create script needs python-mako, see
 > https://github.com/siemens/jailhouse/commit/5c7f2c4c30f19aa7eb95dffa7b7bb92393c09ba7

 > Moreover jailhouse-config-create needs host-python-mako to build
 > jailhouse-config-collect

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
