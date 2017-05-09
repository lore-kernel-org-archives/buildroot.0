From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 May 2017 15:44:06 +0200
Subject: [Buildroot] Upgrading Erlang and ejabberd
In-Reply-To: <CA+-urNQWNUXKHZdjvkcijZYW0OQJr3DMtgQNZmhThC-TssdnNw@mail.gmail.com>
 (Frank Hunleth's message of "Tue, 9 May 2017 09:07:11 -0400")
References: <CA+-urNQWNUXKHZdjvkcijZYW0OQJr3DMtgQNZmhThC-TssdnNw@mail.gmail.com>
Message-ID: <8760hano0p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

Hi Frank,

 > I'd very much like to update the version of Erlang used in Buildroot.
 > I had been doing this quite a while ago, but stopped pushing my
 > changes upstream due to ejabberd breaking. I don't use ejabberd.
 > Updating it and all of its dependencies to work with more recent
 > Erlang versions is turning out to be quite a bit of work and I don't
 > know how to test it to make sure that I didn't break anything.

 > Erlang 20 will be released soon and it has some really interesting
 > improvements that would be great to have available by default in
 > Buildroot. (BR currently has Erlang 18.3; 19.3 is the current
 > release). Is there anyone out there who would mind helping update
 > ejabberd? Johan - you're listed as the ejabberd package maintainer,
 > could you help? Or if not Johan, is anyone else interested?

Added Johan in To:.

Thanks for bringing it up, it would indeed be good to get our erlang
package updated. In the worst case, if nobody wants to do the work to
keep ejabberd uptodate and compatible with newer erlang versions then I
think the way forward is to drop the ejabberd package.

-- 
Bye, Peter Korsgaard
