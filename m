From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 13:52:21 +0100
Subject: [Buildroot] [PATCH 2/7 v3] package infra: do not check hashes
 when downloading from a repository
In-Reply-To: <cb1bbce764c2269fda3da97e99161ad376fc6a89.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <cb1bbce764c2269fda3da97e99161ad376fc6a89.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+pnkOcZbvxm2vZ5uCjyEHxJtnQMpQvWYYQiaqBUMpsXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> When downloading from a repository, we have no way to ensure the
> reproducibility of the generated archives, so we can't check the hashes.
>
> Do not specifiy a hash file in those cases.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
