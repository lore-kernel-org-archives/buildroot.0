From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 18:48:39 +0200
Subject: [Buildroot] Patch: qt5webkitexamples
In-Reply-To: <1402138061.2503.YahooMailNeo@web172304.mail.ir2.yahoo.com>
References: <1402067773.64897.YahooMailNeo@web172303.mail.ir2.yahoo.com>
 <20140607122338.33ab44ce@free-electrons.com>
 <1402138061.2503.YahooMailNeo@web172304.mail.ir2.yahoo.com>
Message-ID: <20140607184839.33bfa8e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Massimo Callegari,

On Sat, 7 Jun 2014 11:47:41 +0100 (BST), Massimo Callegari wrote:

> then I clearly haven't read the whole guidelines in the BR manual.
> Apologies for that.

No problem :-)

> I am totally aware that the patch system this project adopted is
> working since years. Mine was just a suggestion since I work on a
> daily basis with GitHub and I find it simply splendid for code
> review. Maybe it's just my impression but the flow "fork -> patch ->
> pull request" sounds easier than manual git commands where you have
> to remember the email address of a mailing list (thus human
> errors...)

I can help you solve this particular "human error" very easily. Edit
the .git/config file in your Buildroot Git clone, and add:

[sendemail]
        to = buildroot at uclibc.org

Then, you can directly use "git send-email" and it will automatically
send the patches to the mailing list.

> and where dozens of emails float around every day even to
> users not interested in a particular topic. In my opinion a mailing
> list should be used only to discuss bugs, ideas and help users. In
> the current way, users emails risk to get lost into a ton of [PATCH]
> emails. Maybe a ML dedicated to patches could help ?

This has been discussed in previous Buildroot meetings. See
http://elinux.org/Buildroot:DeveloperDaysELCE2013#Community_organization:

"""
The number of mails on the list: it's about 150 e-mails a day, so we
suspect that people who are just using buildroot are scared off from
the list. Hence the idea of splitting the list. Putting the git commits
on a separate mailing list is certainly a possibility, but is going to
remove only 300 of the 2000 mails per month. We don't see a good way to
split the lists at all, because a basic user is very quickly a basic
developer and forcing them to see the patches is probably good. Also
having to subscribe to such a big list is a big threshold. But opening
it to non-subscribers is not a good idea.
"""

> Anyway, I'm not complaining or trying to teach you something. Just
> sharing my opinion. I've seen BR is actually on GitHub, but it's 2
> months behind the current developments. Is that a "dead" idea or lack
> of interest/time ?

It's just that I haven't automated the task of updating our Github
clone, so I only do it from time to time.

> If you want, I'll try to submit my patch again on monday using git
> send-email. The patch is very simple, if you can review it as it is
> it would save me a bit of time and speed things up.

Sure, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
