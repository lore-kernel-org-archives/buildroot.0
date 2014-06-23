From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 07:32:18 +0200
Subject: [Buildroot] [PATCH] graph-depends.py: support python3
In-Reply-To: <1133175477.273342.1403300186442.JavaMail.root@mail>
References: <1133175477.273342.1403300186442.JavaMail.root@mail>
Message-ID: <53A7BBE2.5050603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 23:36, Vivien Didelot wrote:
> Reviewed-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> 
> But there's also support/scripts/graph-build-time and support/scripts/xorg-release.
> There are some calls to the Python executable in docs/manual as well.

 True, but let's take it one step at a time :-)


 Regards,
 Arnout


 BTW, list policy says that you shouldn't top-post. So you would put your
Reviewed-by tag below my Sob, i.e...

> 
> Vivien
> 
> ----- Mail original -----
>> De: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>> ?: buildroot at buildroot.org
>> Cc: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>, "Vivien Didelot" <vivien.didelot@savoirfairelinux.com>
>> Envoy?: Vendredi 20 Juin 2014 16:34:07
>> Objet: [PATCH] graph-depends.py: support python3
>>
>> This patch is the result of 2to3.
>>
>> In addition, universal_newlines=True is added to the Popen calls. In
>> python3, this makes sure that the output is decoded so that we get a
>> string instead of a buffer object.
>>
>> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

... here

 Also, for a long mail, remove the irrelevant part of the quotation, e.g. like this:

>> ---
>>  support/scripts/graph-depends | 24 ++++++++++++------------
>>  1 file changed, 12 insertions(+), 12 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
