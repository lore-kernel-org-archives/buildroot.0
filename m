From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 4 Oct 2017 09:58:38 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
 "netcat" functionality
In-Reply-To: <20171004112008.4426cff9@windsurf.home>
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
 <20171002211840.104aa3df@windsurf.home>
 <1637040809.11941224.1506974995439.JavaMail.zimbra@datacom.ind.br>
 <20171004112008.4426cff9@windsurf.home>
Message-ID: <334684218.12236639.1507121918373.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Sent: Wednesday, October 4, 2017 6:20:08 AM
> Subject: Re: [Buildroot] [PATCH v3] nc: new virtual package providing "netcat" functionality

> Hello Carlos,
> 
> On Mon, 2 Oct 2017 17:09:55 -0300 (BRT), Carlos Santos wrote:
> 
>> > Virtual packages are mainly useful when several variants of a given
>> > library provide the same API, but different implementations, and we
>> > have N consumers of this API. In such a case, a virtual package avoids
>> > having each consumer explicitly handle every possible provider of the
>> > API.
>> 
>> There are three packages able to provide the "nc" command (four, if
>> we count busybox). I want to allow the user to choose only one of them,
>> unambiguously.
> 
> I'm sorry, but I really don't think we want to go down this route.
---8<---

OK, I sent a smaller patch which simply adds an option to build/install
ncat.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
