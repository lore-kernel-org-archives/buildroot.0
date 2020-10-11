From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:07:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: security bump to version
 2.16
In-Reply-To: <20201009161036.1043301-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 9 Oct 2020 18:10:36 +0200")
References: <20201009161036.1043301-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1q4vgh6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix a memory leak in GCM where if passed an unsuitable block cipher (eg
 > not 128 bit) it would throw an exception and leak the cipher object.

 > https://github.com/randombit/botan/blob/2.16.0/news.rst

I wonder in what use case this would be a security issue, E.G. where the
cipher would be provided by an untrusted user?

Oh well, committed - Thanks.

-- 
Bye, Peter Korsgaard
