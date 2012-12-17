From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 17 Dec 2012 13:41:24 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <805796c3-1a48-4485-8d1b-5c1c5d2cbfb4@zimbra2.corp.accelance.fr>
References: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
 <805796c3-1a48-4485-8d1b-5c1c5d2cbfb4@zimbra2.corp.accelance.fr>
Message-ID: <CACQ1gAj-H5P3SaX=fhzxpW=aPwp+kJuZw2CQ9AYgmnSKZKpp7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/17 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> Hello everybody
>
> there is a little bit more work to do on this patch (mainly updating a few more places in the documentation) but i'd like to have a go/no-go before I do that...

I was looking for that kind of feature, I hope it will be accepted.
For now, I use the output/target tree and those parameters in the
/etc/exports file:
*(rw,all_squash,no_subtree_check,anonuid=my_uid,anongid=my_gid)

But that means that all the FS is owned by my user.

Regards,
Richard.
