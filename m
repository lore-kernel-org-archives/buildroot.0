From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Jun 2015 10:37:53 -0300
Subject: [Buildroot] [PATCH] icu: enable parallel build
In-Reply-To: <874mmnoasp.fsf@dell.be.48ers.dk>
References: <1433423876-23823-1-git-send-email-gustavo@zacarias.com.ar>
 <874mmnoasp.fsf@dell.be.48ers.dk>
Message-ID: <557054B1.5090005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/06/15 10:36, Peter Korsgaard wrote:

> Ok, let's see if the autobuilders trigger something - Committed, thanks.

Exactly my thought, it didn't on the 8-core builder i've got, but we'll see.
I also think ruby might follow the same reasoning but i haven't tested 
that so extensively (lots of autodeps).
Regards.
