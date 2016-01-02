From: =?UTF-8?Q?No=C3=A9_Rubinstein?= <noe.rubinstein@gmail.com>
Date: Sat, 2 Jan 2016 09:03:21 +0100
Subject: [Buildroot] [PATCH] tpm-tools: fix build failures caused by
	-Werror
In-Reply-To: <1426132396.18085024.1451316483973.JavaMail.zimbra@datacom.ind.br>
References: <1451309456-27538-1-git-send-email-nrubinstein@aldebaran.com>
 <20151228143749.61f69d04@free-electrons.com>
 <1426132396.18085024.1451316483973.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAOccFZC+6zvJ2z-+OMw13iarkY9SZC1Lfxyqdw9xXRJCuQHBSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Henrique,

On Mon, Dec 28, 2015 at 4:28 PM, DATACOM - henrique.marks
<henrique.marks@datacom.ind.br> wrote:
> Isn't better to fix the code, instead of taking off -Werror ?

Well, -Werror tends to cause build failures on new versions of
compilers, and there are already several patches in Buildroot that
remove -Werror from various packages' build systems. Even upstream
removed -Werror, so I think it is the best thing we can do.

However this case does look like a bug so I will look into fixing this upstream.

-- 
No? Rubinstein.
