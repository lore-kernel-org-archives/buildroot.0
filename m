From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 23:50:43 +0100
Subject: [Buildroot] [PATCH 1/1] package: drop <PKG>_VERSION_MINOR
	variable
In-Reply-To: <1395043601-8302-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Mon, 17 Mar 2014 09:06:41 +0100")
References: <1395043601-8302-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <874n2w4eyk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Since <PKG>_VARIABLE_MINOR variable in some packages is used only once,
 > so it is unusable. This patch removes it.

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
