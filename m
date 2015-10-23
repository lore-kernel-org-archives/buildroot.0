From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 23 Oct 2015 09:40:03 +0200 (CEST)
Subject: [Buildroot] [PATCH 20/21 v2] docs/manual: document the
 br2-external	ID
In-Reply-To: <7fc654ad197b16c299c07a5d3507a009a3345349.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <7fc654ad197b16c299c07a5d3507a009a3345349.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <172158512.1903398.1445586003422.JavaMail.zimbra@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> -+BR2_EXTERNAL+ allows three different things:
> +A +BR2_EXTERNAL+ tree must contain at least those three files:
> +
> ++external.id+::
> +   That file should contain the ID for the +BR2_EXTERNAL+ tree.
> +   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
> +   available in +Config.in+ and +external.mk+ (see below), so that ID
> +   must be a valid make and Kconfig variable. Buildroot sets
> +   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
> ++
> +Examples:
> ++
> +  ** +FOO+ -> +BR2_EXTERNAL_FOO+
> +  ** +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
> +  ** ...
> +

those are example of valid ID, but what is the exact syntax of the file ? 
is it a single line with just the ID ? this is not ver clear here....


Regards

Jeremy
