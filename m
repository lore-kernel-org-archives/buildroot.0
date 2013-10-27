From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 08:24:40 +0100
Subject: [Buildroot] [PATCH 1 of 9 v4] Config.in.legacy: update
	description for developers
In-Reply-To: <da9c19eca655653a9e82.1378152470@argentina> (Thomas De
 Schampheleire's message of "Mon, 02 Sep 2013 22:07:50 +0200")
References: <patchbomb.1378152469@argentina>
 <da9c19eca655653a9e82.1378152470@argentina>
Message-ID: <874n83yy4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 > The existing comments in Config.in.legacy are not entirely in-line with
 > current practice. The comments implies that BR2_LEGACY should not be set when
 > the conversion from old-to-new symbol can be done automatically using the
 > appropriate 'select' statements. However, none of the existing legacy options
 > does it this way. Moreover, I think it's intentional that the user is notified
 > of the change, so that the removal of the legacy options in later buildroot
 > versions no longer poses a problem.
 > Additionally, the comments now describe how to handle string options.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(Finally) committed series with some minor fixups to get them to apply,
thanks!

-- 
Bye, Peter Korsgaard
