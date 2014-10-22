From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:14:39 +0200
Subject: [Buildroot] [PATCH 1/4] scripts/mkusers: allow the creation of
 groups alone
In-Reply-To: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141022221439.34ec2c5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 21 Oct 2014 11:26:36 -0300, Gustavo Zacarias wrote:
> Let mkusers create groups alone, useful for supplementary permissions in
> udev/systemd for example where users can be added to later at runtime.
> Use a magic string "-" to signal that user creation should be skipped.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  support/scripts/mkusers | 2 ++
>  1 file changed, 2 insertions(+)

I've applied the four patches. On the documentation patch, I've taken
into account the suggestion of Yann to slightly adjust the commit.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
