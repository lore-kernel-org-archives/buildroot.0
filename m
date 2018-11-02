From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 2 Nov 2018 23:50:58 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <4c5ee82c-00eb-33e6-6ec1-fc4f21eba039@mind.be>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
 <20181101062448.GC8261@x230>
 <20181101105513.GB4937@smart-ThinkPad-T410>
 <7ba255c0-e72e-7e02-d972-f8f082ce5214@mind.be>
 <20181101161918.GA30470@x230>
 <20181102021259.GA8966@smart-ThinkPad-T410>
 <5b88530949cb4aaf93436bcbc36f9fbf@SOC-EX01V.e01.socionext.com>
 <4c5ee82c-00eb-33e6-6ec1-fc4f21eba039@mind.be>
Message-ID: <20181102225056.GB11633@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> > How about this?
> > https://patchwork.kernel.org/patch/10665119/

>  Perhaps it's better to make the entire pattern explicit, like:

> SED_CONFIG_EXP="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*$\|^#
> \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1\2/p"

> (\1\2 works because only one of the two subexpressions matches, so either \1 or
> \2 must be empty).
I'd prefer original Masahiro's version - it's easier to read and without
duplicity.

>  Regards,
>  Arnout


Kind regards,
Petr
