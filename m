From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 21 Oct 2018 17:46:50 -0200 (BRST)
Subject: [Buildroot] [PATCH] skeleton-init-common: improve /etc/hosts
 generation
In-Reply-To: <b07b2dbf-f9a0-4dfa-31eb-c294e3c55a9f@mind.be>
References: <20181019133802.19627-1-casantos@datacom.com.br>
 <b07b2dbf-f9a0-4dfa-31eb-c294e3c55a9f@mind.be>
Message-ID: <966729012.4094656.1540151210878.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Sent: Saturday, October 20, 2018 9:09:57 AM
> Subject: Re: [Buildroot] [PATCH] skeleton-init-common: improve /etc/hosts generation

> On 19/10/2018 14:38, Carlos Santos wrote:
>> If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
>> add it as an alias, e.g.
>> 
>>     127.0.1.1	hostname.example.com hostname
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Warning: superseded by https://patchwork.ozlabs.org/patch/986832/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
