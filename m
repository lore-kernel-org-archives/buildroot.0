From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Mar 2017 08:14:49 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: fix build for toolchains without
	ssp
In-Reply-To: <20170301214941.4611d6f4@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Mar 2017 21:49:41 +0100")
References: <1488320767-63856-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170301214941.4611d6f4@free-electrons.com>
Message-ID: <87o9xkgnfa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 28 Feb 2017 23:26:07 +0100, Fabrice Fontaine wrote:
 >> Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF to disable custom flags, in
 >> particular -fstack-protector-strong which depends on
 >> BR2_TOOLCHAIN_HAS_SSP
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/cjson/cjson.mk | 5 ++++-
 >> 1 file changed, 4 insertions(+), 1 deletion(-)

 > Applied to master, thanks. Peter: even though this is a build fix, this
 > one is not needed on the LTS branch, because it is only needed after
 > the 1.3.0 bump, which was done post 2017.02.

Ok, thanks for the heads up!

-- 
Bye, Peter Korsgaard
