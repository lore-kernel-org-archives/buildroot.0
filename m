From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:14:20 +0200
Subject: [Buildroot] [PATCH] Cubieboard2 support
In-Reply-To: <1379411163-8349-2-git-send-email-carlos@crqgestion.es>
References: <1379411163-8349-1-git-send-email-carlos@crqgestion.es>
 <1379411163-8349-2-git-send-email-carlos@crqgestion.es>
Message-ID: <20130917201420.68ca1366@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Quijano,

Thanks, but this patch lacks a proper commit log, and doesn't have a
Signed-off-by line. The title should also probably be something like
"board: add cubieboard2 support".

Other than that, it looks good to me. Can you fix these problems and
resend? Also, when you send updated versions, please update the version
number in the patch title, by doing:

 git format-patch --subject-prefix="PATCHv2" HEAD^

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
