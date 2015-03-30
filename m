From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:38:45 +0200
Subject: [Buildroot] [PATCH] logrotate: add hash file
In-Reply-To: <1427747733-8541-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1427747733-8541-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20150330223845.24582317@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon, 30 Mar 2015 22:35:33 +0200, Beno?t Th?baudeau wrote:

> @@ -0,0 +1,2 @@
> +# No upstream hashes for the following:

This should be:

# Locally calculated

> +sha512 342533f321a1d77c0ca389fd0a393377ba73f10654aae163cbd35f8d5df25673f1aa6e44d0af42be5419d152a7dae11024d9005076bce0a3b3dad1f0e12b9c0d logrotate-3.8.9.tar.gz

We normally use sha256 for locally calculated hashes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
