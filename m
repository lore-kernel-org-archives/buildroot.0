From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Thu, 12 Mar 2015 11:59:37 -0400
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 (Emeric Vigier's message of "Tue, 10 Mar 2015 15:28:08 -0400")
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <87385ai4uu.fsf@pcjo.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Emeric Vigier <emeric.vigier@savoirfairelinux.com> writes:

> +make clean-target

Wouldn't it make more sense to name it target-dirclean or
target-clean-something, to comply with Buildroot's usual semantics ?

-- 
J?r?me Oufella
