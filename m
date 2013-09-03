From: Michael Rommel <rommel@layer-7.net>
Date: Tue, 3 Sep 2013 20:04:47 +0200
Subject: [Buildroot] [PATCH 3/3] python-pyzmq: new package
In-Reply-To: <5224B4DB.6060903@mind.be>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <1378071216-19697-3-git-send-email-rommel@layer-7.net>
 <CAAXf6LW=8rf6ScMS0t95f2cDWT4sLxYnMZAnzCYoEQzPVtkKGA@mail.gmail.com>
 <5224B4DB.6060903@mind.be>
Message-ID: <9DACF022-3037-49C2-ACB9-7187991A4EFA@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sep 2, 2013, at 17:55 , Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/02/13 10:24, Thomas De Schampheleire wrote:

Hi Arnout and Thomas,

I incorporated all your suggestions here and some additional changes I saw myself:
 - added host-python dependency
 - removed mentioning of minimum zeromq version needed
 - combined comments for dependencies on IPv6 and WCHAR
 - fixed naming of the patch hook
 - used $(PYTHON_DIR) - although for the heck of me I could not find out, where this is defined :-(
 - changed depends on PYTHON from select (actually, I got it wrong, using the select gave the cyclic dependency :-()
 - named the package, bool and filenames consistently python-pyzmq
 
Patch will come in some minutes.

Cheers,

   Michael.

-- 
Michael Rommel, Erlangen, Germany
