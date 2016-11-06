From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 01:51:55 +0100
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <7b4bc8b4-db76-7703-54ce-72d923c00a41@mind.be>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
 <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <7b4bc8b4-db76-7703-54ce-72d923c00a41@mind.be>
Message-ID: <d9d336a7-6e7f-1a2d-d820-85af033a196c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 01:19, Arnout Vandecappelle wrote:
>  Second, instead of all these given's etc., it is much simpler to set up a
> single test repo, once, that has all the features you need. Setting it up could
> either be through explicit git commands, but I think it's even simpler if you
> just create a bare repository and commit that into Buildroot. It's not very nice
> for review, but I think it simplifies things enough to make it worth it. And
> anyway, the contents of the objects are not so important for review. If you do
> this, remove the hooks and info directories to make it smaller, and make sure
> the objects directory is binary. You know, I'll send a patch to show you how.

 So I've taken another look at the tests you created, and it looks like it is
indeed a lot simpler and more effective to create the repo on the fly rather
than having a repo checked in into Buildroot. So forget this remark.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
