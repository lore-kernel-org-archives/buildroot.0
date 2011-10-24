From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 08:23:16 -0300
Subject: [Buildroot] GnuPG
In-Reply-To: <32709446.post@talk.nabble.com>
References: <0D753D10438DA54287A00B02708426976450C42C46@AUSP01VMBX24.collaborationhost.net>
 <32709446.post@talk.nabble.com>
Message-ID: <8167afaddbb08fc25202dbf489d78389@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24.10.2011 08:12, ilranzani wrote:

> Nobody?
>
> (in buildroot there's already libgcrypt)
>
> UP UP UP ! :)

It's not too hard, you just need to add a couple of extra libraries 
(packages) that it needs, IIRC libassuan and libksba.
The rest of the mandatory dependencies are already available 
(libgpg-error & libgcrypt).
Regards.
