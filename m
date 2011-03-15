From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 23:33:47 +0100
Subject: [Buildroot] [PATCH] fetch/git: clone the as bare
In-Reply-To: <1300193398-15217-1-git-send-email-plagnioj@jcrosoft.com>
References: <1300193398-15217-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <20110315233347.5dc5dd09@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Mar 2011 13:49:58 +0100
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:

> this will reduce the space used and speed up the clone
> as we will generate an archive later which does need the tree checkouted
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Sounds good to me.

Could you resend a new version with a correct title, such as
"fetch/git: clone the repository as bare" or something like that ?

It would then get my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
