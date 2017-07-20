From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:28:39 +0200
Subject: [Buildroot] [PATCH 1/2] scanpypi: don't pass any arguments to
 main()
In-Reply-To: <20170720052638.32122-1-alexey.roslyakov@gmail.com>
References: <20170720052638.32122-1-alexey.roslyakov@gmail.com>
Message-ID: <20170720222839.55865d87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 12:26:37 +0700, Alexey Roslyakov wrote:
> 'if __name__ == "__main__"' idiom typically calls main function that
> doesn't take any arguments in most cases. We shouldn't pass any tuple to
> it.
> I've tested the script with python-idna-2.5 and now it works with this
> little change.
> 
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
