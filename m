From: GabrielCastillo <gcastillo@controlnet.com.ar>
Date: Thu, 11 Feb 2016 07:09:50 -0800 (PST)
Subject: [Buildroot] Setting RGB
In-Reply-To: <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net> <1455126039107-125494.post@n4.nabble.com>
 <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
Message-ID: <1455203390156-125571.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Definitely the problem is with QT5. I read some places that could be
littleendian problem. To run my app, i do:

> ./App -platform linuxfb

There are any form to tell that it has to be execute in littleendian or
bigendian?



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Setting-RGB-tp124903p125571.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
