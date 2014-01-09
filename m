From: Andre Renaud <andre@bluewatersys.com>
Date: Thu, 9 Jan 2014 16:23:26 +1300
Subject: [Buildroot] Empty utility package scripts
In-Reply-To: <874n5eno6i.fsf@dell.be.48ers.dk>
References: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
 <874n5eno6i.fsf@dell.be.48ers.dk>
Message-ID: <CAPfzE3Zk3E2S__B1+w755zr+UT=Cdzr5BQdYcHKoDQTLydTY1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 January 2014 10:44, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Andre" == Andre Renaud <andre@bluewatersys.com> writes:
>  > I'm trying to create a utility package script which doesn't do any
>  > downloading, just copies some local files around (startup scripts),
>  > and creates a user in /etc/passwd. However I can't find any examples
>  > of packages that don't do any downloading/configuring/building.
>
>  > Is this possible, or am I going about it the wrong way?
>
> Sure, have a look at package/makedevs (that one does build a binary though).

Thanks to both Peter and Yann. Having the package_SOURCE entry blank
was the step that I was missing.

Regards,
Andre
