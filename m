From: Stefan Becker <chemobejk@gmail.com>
Date: Sun, 16 Dec 2018 18:19:04 +0200
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <CAOJ2eMdF2qZL6yFenfO6xVeZxf_gBgBejQ=PX6HpcEvs26pRCw@mail.gmail.com>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
 <20181216145427.0274aed5@windsurf.home>
 <CAOJ2eMcWOj2gvGWHNoZm3ofz2O=LjGj7F02Gy73RyiYP7Pvcmg@mail.gmail.com>
 <20181216161430.1752d2f0@windsurf.home>
 <CAOJ2eMdF2qZL6yFenfO6xVeZxf_gBgBejQ=PX6HpcEvs26pRCw@mail.gmail.com>
Message-ID: <CAOJ2eMdhO2e3HH2ZA0ExfZ-rardYxXteGmEM1rHS8AxZHVNJKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 16, 2018 at 5:33 PM Stefan Becker <chemobejk@gmail.com> wrote:
>
> * buildroot: output/target/, host/ plus selected buildroot meta build
> system source files required for flash image build + module install
> script

To be more exact:

* build artefact 1: SDK
* build artefact 2: output/target + selected buildroot meta build
system source files required for flash image build + module install
script

Build artefact is a dependency for module builds that require target
toolchain, e.g. kernel build.

Regards, Stefan
