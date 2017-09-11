From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 11 Sep 2017 15:12:08 -0400
Subject: [Buildroot] [PATCH] support/download: print dl hash if not
 provided
In-Reply-To: <20170910092955.GD3536@scaer>
References: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
 <20170910092955.GD3536@scaer>
Message-ID: <20170911191208.at72rz23a7y25nvj@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Sep 10, 2017 at 11:29:55AM +0200, Yann E. MORIN wrote:
> Ga?l, All,
> 
> On 2017-07-19 23:18 -0400, Ga?l PORTAY spake thusly:
> > ...
> > 
> > It also fixes check_one_hash description. check_one_hash() takes three
> > arguments:
> >  - algo hash
> >  - known hash
> >  - file to hash
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> NAK from me.
> 
> The reason we do not want this is that we instead want the user to go
> fetch the hash(es) as provided by upstream, like in an announcement
> email, or in an on-the-side hash file.
> 
> Having the download infra print the locally computed hash defeats the
> very purpose of hashes: check that we get what upstream provides.
> 
> We only accept local calculations of hashes for the cases where upstream
> does not provide any (or too weak) hash.
>

Okay.

> As an aside, this patch does two things: fix the comment for
> check_one_hash() and print the hash. It should be split.
>

I will send a patch for this tiny nitpick.

Regards,
Ga?l
