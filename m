From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 20:27:10 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
Message-ID: <6d079de8-047a-3a2e-10f4-c66e86ff9a98@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-04-17 19:00, Arnout Vandecappelle wrote:
>  This is the correct approach I think. I think we could also do this for all the
> other cases where we have a -> busybox dependency just because they install the
> same apps.

 Sorry, I was writing this on the train and hadn't seen Thomas's "Applied,
thanks" mail.

 Please ignore.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
