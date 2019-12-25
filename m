From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:50:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: add autoreconf
In-Reply-To: <20191224080625.564034-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 24 Dec 2019 09:06:25 +0100")
References: <20191224080625.564034-1-fontaine.fabrice@gmail.com>
Message-ID: <87h81oqdkv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit feef4b733c4e5a6ee89d1554d29786304be7a720 added a patch on
 > configure.ac but forgot to set QUOTA_AUTORECONF=YES

 > Fixes:
 >  - http://autobuild.buildroot.org/results/15f2dbfbafc91719ad1f5209811300ddaa5cec91

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
