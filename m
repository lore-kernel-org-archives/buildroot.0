From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Apr 2015 22:17:15 +0200
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <20150416173330.GC4405@free.fr> (Yann E. MORIN's message of "Thu, 
 16 Apr 2015 19:33:30 +0200")
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
 <alpine.LFD.2.11.1504160912290.18180@localhost>
 <20150416170525.GA4405@free.fr>
 <alpine.LFD.2.11.1504161307160.1401@localhost>
 <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
 <20150416173330.GC4405@free.fr>
Message-ID: <871tjev9kk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> That said, adding support for file:// in BR2_PRIMARY_SITE is trivial to add. In 
 >> fact, I used to have such a patch in a much older buildroot version.

 > Well, I was thinking of this, too, but I really wonder if that makes
 > sense: archives are copied from the primary, so you'd end up with
 > duplication locally.

 > Unless we're playing it smart and make symlinks.

 > But then what would happen if the archive disapear from primary?

I would prefer to keep it dumb and simple. The typical usecase for
BR2_PRIMARY_SITE is imho just to use to local mirror for download speed
/ reliability reasons (that's atleast what I have used it for).

I don't feel strongly for/against file:// support, but if there's a
desire to add it ..

-- 
Bye, Peter Korsgaard
