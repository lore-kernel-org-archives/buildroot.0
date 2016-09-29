From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 29 Sep 2016 13:22:58 -0400
Subject: [Buildroot] [RCF 1/2] support: enforce '--binary' when applying
	patches
In-Reply-To: <764549583.350082.1475165464533.JavaMail.zimbra@datacom.ind.br>
References: <20160929145701.27116-1-james.knight@rockwellcollins.com>
 <764549583.350082.1475165464533.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CALe+oY_6UYYFR9VrHe9sGxy1t-9S_+=iwbLx+LDPgJVig2yCNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Thu, Sep 29, 2016 at 12:11 PM, Ricardo Martincoski
<ricardo.martincoski@datacom.ind.br> wrote:
>
> This change can have issues with old distros, see below.
> Currently buildroot does not enforce a minimal version of 'patch'.

Good to know; thanks for the information. I'll try an alternative
solution for my current situation [1].

[1]: https://patchwork.ozlabs.org/patch/676644/
