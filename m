From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 3 Jun 2013 14:37:36 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <20130603152405.731dd2a3@skate>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
 <20130603144414.562f9385@skate>
 <CAHt8ZCO8PF0gxsvDWtCgWRdpbnUwGoNJmUdqe-eRO9ZKznJVZg@mail.gmail.com>
 <20130603152405.731dd2a3@skate>
Message-ID: <CAHt8ZCOK2iM-gZvCdU0Gbp8ykjWC+-2eOcui0y2yX+d9+GDqMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 June 2013 14:24, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Ok, the configure script is stupid (checking for a library existence
> before calling mysql_config), but ok, I guess we have to live with
> that :)

Yes, agreed.

Simon.
