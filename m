From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 14:58:23 +0100
Subject: [Buildroot] [PATCH v10 08/10] cargo: new package
In-Reply-To: <87eflzwx49.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 05 Feb 2018 11:26:30 +0100")
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-9-eric.le.bihan.dev@free.fr>
 <87eflzwx49.fsf@dell.be.48ers.dk>
Message-ID: <87po5jv8qo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +CARGO_DEPS_SHA512 =
 >> 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21
 >> +CARGO_DEPS_SITE =
 >> http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)

 > Is that the official location for this?

 > pkgs.fedoraproject.org is failing for me at the moment :/

Committed after changing to src.fedoraproject.org, thanks.

-- 
Bye, Peter Korsgaard
