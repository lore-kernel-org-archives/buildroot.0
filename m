From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 23:46:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 4.2.0
In-Reply-To: <20191031220306.122761-1-julien.grossholtz@openest.io> (Julien
 Grossholtz's message of "Thu, 31 Oct 2019 23:03:06 +0100")
References: <20191031220306.122761-1-julien.grossholtz@openest.io>
Message-ID: <87tv7o354j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Grossholtz <julien.grossholtz@openest.io> writes:

 > WolfSSL 4.2.0 has been released, it includes new features and fixes. The
 > full changelog is available here [1].

 > Update the wolfssl package to stable version 4.2.0 and the
 > corresponding hash file.

 > [1] https://www.wolfssl.com/docs/wolfssl-changelog/

 > Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>

Committed, thanks.

We currently do not have any package in Buildroot depending on
wolfssl. It looks like libcurl can use it as a TLS backend, care to send
a patch to add support for that?

-- 
Bye, Peter Korsgaard
