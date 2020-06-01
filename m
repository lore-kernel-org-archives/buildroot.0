From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:03:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: propagate missing
 libdrm-freedreno deps
In-Reply-To: <20200526202437.4126010-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 26 May 2020 14:24:37 -0600")
References: <20200526202437.4126010-1-james.hilliard1@gmail.com>
Message-ID: <87mu5mh7ti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
 > as such we need to propagate those dependencies to mesa's gallium
 > freedreno driver.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - add note about LIBDRM_HAS_ATOMIC dependency

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
