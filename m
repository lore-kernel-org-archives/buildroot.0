From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:36:13 +0200
Subject: [Buildroot] [next v2 5/7] testing/tests/download: add git hash
	tests
In-Reply-To: <20170826222056.6119-5-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-5-ricardo.martincoski@gmail.com>
Message-ID: <d3fa4a4e-d080-0892-3abf-8f001a4bea03@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Add three test cases for hash of a git package:
>  - correct hash;
>  - wrong hash;
>  - no hash file.
> 
> Besides the Python script, add some fixtures used during the tests:
>  - a br2-external (git-hash) with one package for each test case;
>  - a static git bare repo (repo.git) to be served using GitRemote class
>    for all these test cases.
> 
> Neither the br2-external nor the check hash functionalities are the
> subject of these tests per se, so for simplicity limit the check to the
> error codes and don't look for the messages in the log.
> 
> Thanks to Arnout for the hint about how to add a bare repo to test.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
