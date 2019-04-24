From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:00:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipsec-tools: fix static build
 with openssl and atomic
In-Reply-To: <20190413084912.8000-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:49:12 +0200")
References: <20190413084912.8000-1-fontaine.fabrice@gmail.com>
Message-ID: <877ebj9nso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find openssl dependencies such as lz or latomic
 > Fix static build on sparc v8 (even if there is no autobuilder failures
 > yet)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
