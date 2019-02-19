From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Feb 2019 10:14:52 +0100
Subject: [Buildroot] git send-email with Outlook / NTLM ?
In-Reply-To: <2748BB04F99E7E45A3203C831E8B20FE34D35C13@SERBE4I2.intra.erbe-med.de>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35B97@SERBE4I2.intra.erbe-med.de>
 <20190218225858.05f8d246@windsurf.home>
 <2748BB04F99E7E45A3203C831E8B20FE34D35C13@SERBE4I2.intra.erbe-med.de>
Message-ID: <20190219101452.5145a2b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've re-added the Buildroot mailing list in Cc, please keep the list
Cc'ed for this discussion.

On Tue, 19 Feb 2019 09:01:43 +0000
"Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

> The mismatch and also the line wrapping was most likely happening
> because I needed to send the mail with Outlook. Our SMTP server only
> allows NTLM auth and I couldn't get git-email-send to work with it
> (The git-email-send-ntlm project is also not working for me). I don't
> think I can change the From: within outlook. But I could change the
> Signed-off-by: to match it if this is better. If you know any way to
> use git-email-send with NTLM please let me know.

I am in the lucky situation that I don't have to use an Outlook e-mail
server, so I have no idea if git send-email can work with NTLM. Perhaps
other people in the list will know ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
