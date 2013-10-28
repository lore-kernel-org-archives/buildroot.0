From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 28 Oct 2013 09:11:16 -0500
Subject: [Buildroot] [PATCH 5/5] thrift: new package
In-Reply-To: <526E4446.1090806@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
 <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
 <526B8FEC.2000607@zacarias.com.ar> <526E1146.2070902@mind.be>
 <526E4446.1090806@zacarias.com.ar>
Message-ID: <OF50AC6C4A.47FC76CF-ON86257C12.004BD3EC-86257C12.004DEECE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Arnout,

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/28/2013 06:02:30 
AM:

> On 10/28/2013 04:24 AM, Arnout Vandecappelle wrote:
> 
> >  But not as much as requiring 80 hashes in the header :-)
> 
> Pfffft, that's not mine :)
> 
> >  It's not because it wasn't done right in the past that it shouldn't 
be
> > done right now :-)
> 
> Some licenses were defined a few days ago that weren't the last lines
> before defines and nobody said anything, you should have shown up then 
:P
> 
> >  I agree with Ryan that it would be a good idea to standardize on some
> > order of the variable definitions. But since there is not standard at
> > the moment, we have to wait for an edict from Peter before we can
> > enforce it.
> 
> Propose it then and get it rolling, for the time being there's no rule
> about it.

I never was intending for you to change it, rather it was a suggestion and 
I don't have any standard to fall back on to back me up. 

> >  That it's implicit from openssl is not really relevant - if the
> > dependency is ever removed from openssl (OK, this will not happen, but
> > just imagine) then we'd like to keep the correct dependency here.
> 
> Ok.
> All the packages that use openssl should be checked though, almost none
> of them do zlib either (doesn't mean they use it directly, but a good
> check wouldn't hurt).

I guess all I really care about is a comment in regards to zlib being 
built from having dependancy on openssl. I don't always remember these 
things so just a friendly reminder comment is good enough.

Thanks,
-Ryan
