From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 6 Aug 2010 13:25:47 +0200
Subject: [Buildroot] [RFC]  [PATHC] Added splashy package update
Message-ID: <AANLkTimkUu0UDnEEvh7eHLYpwE=P4qufPgYf11+ODeXk@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Comment from Mitch Davis <mjd+buildroot@afork.com> corrected.
For correct downloading splashy need to configure wget with
--no-check-certificate
(how to add permanently to wget configuration?).
File package installing to staging is necessary because splashy dependency.
