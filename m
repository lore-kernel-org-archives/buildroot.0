From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 19:25:17 +0200
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <87tw2f9lic.fsf@dell.be.48ers.dk>
References: <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
 <0db10485-c5ee-5097-97f4-aaadd2535761@microchip.com>
 <20170713095003.057fb2bc@windsurf.orange-hotspot.com>
 <20170713153220.GA3002@scaer>
 <2a450d8b-10a6-2be9-b7a7-a659a47bffb0@mind.be>
 <20170714103518.66ca2b7e@windsurf>
 <87o9snb1ri.fsf@dell.be.48ers.dk>
 <20170714153641.0e0af325@windsurf>
 <87tw2f9lic.fsf@dell.be.48ers.dk>
Message-ID: <20170716172517.GE30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, Arnout, Joshua, All,

On 2017-07-14 15:49 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  >> As long as we can find a solution for this problem I don't think we
>  >> should move to sperate files for license hashes. We have 2k+ packages
>  >> and only a very small subset of those have a version selection (and only
>  >> a small subset of that subset will change the license text between
>  >> versions), so I prefer a less-clean solution for this special case
>  >> instead of adding 2k+ extra files to the tree.
> 
>  > Yes, true.
> 
>  > So perhaps the easy solution is to search for a hash file in the
>  > version-specific sub-folder. If it exists, use it (and only this one).
>  > If it doesn't exist, fallback to the one in the package directory.
> 
> Yes, makes sense to me.

Done, version 2 sent:
    http://lists.busybox.net/pipermail/buildroot/2017-July/198080.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
