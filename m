From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 15:26:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/sslh: fix static build with pcre
In-Reply-To: <20201015060901.137916-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 15 Oct 2020 08:09:01 +0200")
References: <20201015060901.137916-1-fontaine.fabrice@gmail.com>
Message-ID: <875z6ujukk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix static build failure with sslh version 1.19b and above


 > Fixes:
 >  - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605

Hmm, any idea why we only see this with 1.21c on the autobuilders and
not with 1.20?

-- 
Bye, Peter Korsgaard
