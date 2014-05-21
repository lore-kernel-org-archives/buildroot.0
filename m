From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Wed, 21 May 2014 20:26:23 +1200
Subject: [Buildroot] [PATCH 3/3] python: new module cffi
Message-ID: <CAAwwcmRbgqBacovNfSRFbrThg=jdOnAfi2YvXGhr5eE1uSzo8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

- Why cffi:
 <http://eev.ee/blog/2013/09/13/cython-versus-cffi/> makes me think that
'ease of use' and performance are good.

- Unfortunately I have not the resources to test with python-3 in the
foreseeable future.

- From the documentation <http://cffi.readthedocs.org/en/release-0.8/>: "
libffi is notoriously messy to install and use ? to the point that CPython
includes its own copy to avoid relying on external packages".
 I will have to look into the dependencies more carefully and see if there
is no dependence.

- Perhaps I submitted the patch prematurely.
  My primary aim is to get "smbus-cffi", <
https://pypi.python.org/pypi/smbus-cffi> working for an Olimex iMx233
system or, if I cannot, to roll my own.
  I installed python-cffi on the side because I thought it might be
necessary.

Thanks, I hope I don't bore you with all that.

Kind regards, oli
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140521/b9adecdb/attachment.html>
