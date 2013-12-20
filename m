From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 20 Dec 2013 10:43:10 +0100
Subject: [Buildroot] More work on a package updates checking tool
In-Reply-To: <CACjG4BJuyTZ=Fbgmt=qiNs+qn1pQt0R6xV+MCw_5CKbc+XFZqg@mail.gmail.com>
References: <CACjG4BJuyTZ=Fbgmt=qiNs+qn1pQt0R6xV+MCw_5CKbc+XFZqg@mail.gmail.com>
Message-ID: <52B4112E.7070703@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Arnaud,

> Hi there,
>
> I did more work on a tool to check if packages are up-to-date.
> This is still a dev script, so kind of ugly, but the output is really 
> better, even if there is still some false detections.
>
> generated html : http://intelibre.fr/buildroot/out.html

My suggestion is that in the case of commit ID's, to display only the 
first 7 hex characters, e.g. 1234567... .
If the first 7 hex characters of current and last version are the same, 
the background color will indicate the difference.

Regards,
Jerzy

> script : http://intelibre.fr/buildroot/check-updates.py
> everything else : http://intelibre.fr/buildroot/
>
> Hope you can find some interests in it.
>
> Best,
>
> Arnaud
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
