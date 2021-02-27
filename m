From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:58:26 +0100
Subject: [Buildroot] [PATCH] package/cegui: override first _CONF_OPTS
 instead of appending
In-Reply-To: <20210218175905.9837-1-b.bilas@grinn-global.com> (Bartosz Bilas's
 message of "Thu, 18 Feb 2021 18:59:05 +0100")
References: <20210218175905.9837-1-b.bilas@grinn-global.com>
Message-ID: <87zgzps88t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > During the package update, there was a mistake
 > and we appended the options to the first CONF_OPTS
 > variable instead of overriding it.
 > Fix that by removing an append-assignment.

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
