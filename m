From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Fri, 1 Nov 2019 16:04:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 4.2.0
In-Reply-To: <87tv7o354j.fsf@dell.be.48ers.dk>
References: <20191031220306.122761-1-julien.grossholtz@openest.io>
 <87tv7o354j.fsf@dell.be.48ers.dk>
Message-ID: <CAFN3DJgRHw09M5yqnbwLxrC_TPcxpDkn-GoZnZcLObG6HD+YqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for applying this. I will submit a patch to allow WolfSSL as a SSL
backend for libcurl.

Regards,

Le ven. 1 nov. 2019 ? 10:18, Peter Korsgaard <peter@korsgaard.com> a ?crit :

> >>>>> "Julien" == Julien Grossholtz <julien.grossholtz@openest.io> writes:
>
>  > WolfSSL 4.2.0 has been released, it includes new features and fixes. The
>  > full changelog is available here [1].
>
>  > Update the wolfssl package to stable version 4.2.0 and the
>  > corresponding hash file.
>
>  > [1] https://www.wolfssl.com/docs/wolfssl-changelog/
>
>  > Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
>
> Committed, thanks.
>
> We currently do not have any package in Buildroot depending on
> wolfssl. It looks like libcurl can use it as a TLS backend, care to send
> a patch to add support for that?
>
> --
> Bye, Peter Korsgaard
>


-- 

*Julien Grossholtz*
Directeur de projet
julien.grossholtz at openest.io
+33 7 68 49 83 47

        <https://openest.io/>
Logiciels embarqu?s pour syst?mes intelligents

15, avenue du Rhin ? 67100 Strasbourg ? www.openest.io
<http://openest.io/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191101/b1fe10f6/attachment.html>
