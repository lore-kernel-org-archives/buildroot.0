From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 24 Nov 2006 13:07:41 +0100
Subject: [Buildroot] problem with absolute paths to tools in ccache
In-Reply-To: <20061124105312.100310@gmx.net>
References: <20061124105312.100310@gmx.net>
Message-ID: <20061124120740.GA5505@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 24, 2006 at 11:53:12AM +0100, Real.Magic at gmx.de wrote:

>I have got a problem because ccache is using absolute paths to the ccache working directory and to the tools like gcc.
>
>To prevent ccache from using an absolute path to the ccache working directory, I have applied the following patch successfully:
>
>http://www.busybox.net/lists/buildroot/2006-October/000355.html

1) I don't use ccache
2) If somebody can come up with a patch that makes ccache behave like
the majority desires (or as it is intended), then bug Eric or Mike or
anybody else who uses ccache to apply it.

>But how can I prevent ccache from using absolute paths to tools like gcc?

no idea, see 1)
sorry but i can't help with this, fwiw.
