From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 22:21:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: security bump to
 version 4.3.0
In-Reply-To: <87lfp6dwnk.fsf@dell.be.48ers.dk>
References: <20200213184148.2090807-1-fontaine.fabrice@gmail.com>
 <87lfp6dwnk.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81yF9SRvUHrg_8zwv7Mt4zObkQOryLCUzGUFetOTMneyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 13 f?vr. 2020 ? 22:06, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > From https://www.zetetic.net/blog/2019/08/14/defcon-sqlite-attacks:
>  > "We strongly recommend that all applications upgrade to SQLCipher 4.2.0
>  > to take advantage of the latest security updates, especially if an
>  > application interacts with non-encrypted databases using SQLCipher."
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed, thanks.
>
> What should we do for 2019.02.x (which uses 3.2.0)?
3.2.0 has been released in 2014 and is based on SQLite 3.8.6 which is
very old and subject to multiple CVEs so I would advise to bump from
3.2.0 to 4.3.0.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
