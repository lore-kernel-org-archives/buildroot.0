From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:15:39 +0200
Subject: [Buildroot] [PATCH 3/3] package/gmrender-resurrect: add libupnp
 1.14.x support
In-Reply-To: <20200821204139.3682940-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 Aug 2020 22:41:39 +0200")
References: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
 <20200821204139.3682940-3-fontaine.fabrice@gmail.com>
Message-ID: <87d036bmhg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Using libupnp 1.14.x is needed to fix CallStranger a.k.a. CVE-2020-12695
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It would be good to add a link to the upstream PR (which also explains
why you are doing those "unrelated" centos/fedora changes):

https://github.com/hzeller/gmrender-resurrect/pull/214

-- 
Bye, Peter Korsgaard
