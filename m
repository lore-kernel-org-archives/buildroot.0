From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 20 Nov 2013 16:34:38 +0100
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <20131108153527.0ef57df0@skate>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
 <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
 <526809E4.30203@mind.be>
 <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
 <CAAXf6LV9pBCwsqrtm6LJxiO1oaYX4afBv0tHPgOqVReV058GTA@mail.gmail.com>
 <CACjG4BJ0Qzv=GevE3rNHvc3n-YxOTg7FpWHmz1sAz4Q6+Q3wyg@mail.gmail.com>
 <CACjG4BKXOp8oD1_j2ERCzn=ZUGj_G--Putxq0GrA4eHWG0VFwQ@mail.gmail.com>
 <20131108153527.0ef57df0@skate>
Message-ID: <CACjG4BJW6LOdG1V1spA4RW1b8fKud-aWBioaMJ8=Skuz1QhFHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I updated the script to check package updates. It improved a lot :)
Current result are 841 packages checked : 372 up to date, 315 can be
updated and 154 are unknown.
It's still in developpement, there is a lot of thinks that can be improved :
  - handle svn
  - add a 'status' column
  - improve checking of sourceforge project, currently I retrieve last
version of the project using a /latest url, but it's not working when the
project provides several tools or libraries.
  - for projects using git, if the version is a hash, I retrieve HEAD hash
and compare it to the version, but I'm not checking if the hash represent a
tag (ie, most of the time a stable release)
  - code refactoring to avoid code duplication

2013/11/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Also, it would be nice if you could order the list of packages
> alphabetically.
>

Done ! You can click on the column title to sort packages

Regards,

Arnaud
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/8fe45b76/attachment.html>
